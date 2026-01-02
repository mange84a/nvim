require("CopilotChat").setup {
    model = 'gpt-4o', -- Default model to use, see ':CopilotChatModels' for available models (can be specified manually in prompt via $).
    agent = 'copilot', -- Default agent to use, see ':CopilotChatAgents' for available agents (can be specified manually in prompt via @).
    prompts = {
        PHPDocPrompt = {
            prompt = 'Add comment to before the current selected function in PHPDoc syntax.',
            system_prompt = 'You are very good at PHPDoc, right?',
            mapping = '<leader>ccmc',
            description = 'PHP Doc Comment',
        }
    }
}
